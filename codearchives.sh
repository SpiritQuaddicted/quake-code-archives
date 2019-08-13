scriptdir=$(pwd)
workingdir=/tmp/

# initial grabbing, simply errors if the directory exists so re-running on the same repo does not hurt
cd "${workingdir}"
echo "git cloning"
while read repo
do
	git clone ${repo//https:\/\//http:\/\/foo:bar@} # no quotes here, git needs to see both arguments separatedly ;)
done < ${scriptdir}/repos.git

echo "git svn cloning"
while read repo
do
	git svn clone ${repo} # no quotes here, git needs to see both arguments separatedly ;)
done < ${scriptdir}/repos.svn

# updating
cd "${workingdir}"
echo "git pulling, git svn fetching"
for dir in */
do
	echo "Updating ${dir} ..."
	cd "${workingdir}/${dir}"
	git pull -u # try git
	git svn fetch # try svn
done
