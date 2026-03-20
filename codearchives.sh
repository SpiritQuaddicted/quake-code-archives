set -x

scriptdir=$(pwd)
workingdir=~/archives

# don't prompt for user/pass, just keep going
export GIT_TERMINAL_PROMPT=0

# initial grabbing, simply errors if the directory exists so re-running on the same repo does not hurt
cd "${workingdir}"
echo "git cloning"
while read repo
do
	git clone ${repo//https:\/\//http:\/\/foo:bar@} || echo "dir probably already existed (SVN)..." # no quotes here, git needs to see both arguments separatedly ;)
done < ${scriptdir}/repos.git

echo "git svn cloning"
while read repo
do
	git svn clone ${repo} || echo "dir probably already existed (SVN)..." # no quotes here, git needs to see both arguments separatedly ;)
done < ${scriptdir}/repos.svn

# updating
# TODO identify VCS per directory
cd "${workingdir}"
echo "git pulling, git svn fetching"
for dir in */
do
	echo "Updating ${dir} ..."
	cd "${workingdir}/${dir}"
    git pull || echo "git pull failed"  # try git
    git svn fetch || echo "svn fetch failed"  # try svn
done
