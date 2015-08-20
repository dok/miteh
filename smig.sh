cmd=$1
options=$2

cmd_path="./$cmd.sh"

if [ -a $cmd_path ]; then
    $cmd_path $2
else
    echo "That command does not exist: $cmd"
    echo "-------------------USAGE----------------------"
    echo "legend: [required]{command} [optional]{name}"
    echo "./smig.sh use {latest|original}"
    echo "./smig.sh copy"
    echo "./smig.sh clean"
    echo "----------------------------------------------"
fi
