workingdir=$(pwd)

# initial grabbing
while read repo
do
	git clone ${repo} # no quotes here, git needs to see both arguments separatedly ;)
done < repos.git

while read repo
do
	git svn clone ${repo} # no quotes here, git needs to see both arguments separatedly ;)
done < repos.svn

# updating
cd "${workingdir}"
for dir in */
do
	cd "${workingdir}/${dir}"
	git pull -u
done
