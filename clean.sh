echo "Do you wish to clear your snapshots directory?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) rm -rf /Users/seandokko/workspace/data/snapshots/*; break;;
        No ) exit;;
    esac
done

