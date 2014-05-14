scriptdir=$(pwd)
workingdir=~/archives/

# initial grabbing, simply errors if the directory exists so re-running on the same repo does not hurt
cd "${workingdir}"
while read repo
do
	git clone ${repo} # no quotes here, git needs to see both arguments separatedly ;)
done < ${scriptdir}/repos.git

while read repo
do
	git svn clone ${repo} # no quotes here, git needs to see both arguments separatedly ;)
done < ${scriptdir}/repos.svn

# updating
cd "${workingdir}"
for dir in */
do
	cd "${workingdir}/${dir}"
	git pull -u
done
