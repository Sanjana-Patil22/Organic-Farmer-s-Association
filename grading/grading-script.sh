args=("$@")
INPUT=${args[0]}
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read sno reader student id sid email cruzid timestamp commitid green_check ack
do
    if [ -z "$cruzid" ];
    then
        :
    else
        if [ "$cruzid" != "timestamp" ]; then
            git clone git@git.ucsc.edu:cse13s/fall22/"$cruzid".git && echo "Execute git clone for cruzid $cruzid"
            cd "$cruzid" && echo "change into $cruzid directory"
            git checkout "$commitid" && echo "checkout commitid: $commitid"
            cd ..
        fi
    fi
done < $INPUT
IFS=$OLDIFS
