for file in $(find . -type f -name "*.c")
do  
    trimmedName=`echo $file | cut -d'/' -f2 | cut -d'.' -f1`
    pp=20
    gcc -o $trimmedName $file 2>/dev/null
    if [ -f $trimmedName ]
    then    
        ans=$(./$trimmedName)
        if [ $ans -eq $pp ]
        then 
            p=10
        else
            p=7
        fi
    else
        p=5
    fi
    printf "%s %s\n" $trimmedName $p
done