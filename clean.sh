echo "Do you wish to clear your snapshots directory?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) rm -rf /usr/local/var/mongodb/snapshots/*; break;;
        No ) exit;;
    esac
done

