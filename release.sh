# send debs to server
rsync -azP --include './' --include '*.deb' --exclude '*' ./output/ ferreo@direct.pika-os.com:/srv/www/incoming/

# add debs to repo
ssh ferreo@direct.pika-os.com 'aptly repo add -force-replace -remove-files pikauwu-main /srv/www/incoming/'

# publish the repo
ssh ferreo@direct.pika-os.com 'aptly publish update -batch -skip-contents -force-overwrite pikauwu filesystem:pikarepo:'

cp -vf ./output/pika-sources*.deb  ./output/pika-sources.deb 
rsync ./output/pika-sources.deb ferreo@direct.pika-os.com:/srv/www/pikarepo/dists/pikauwu/
