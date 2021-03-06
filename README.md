## You want to contribute?

Open your terminal, and `cd` to the right directory. You will work in a branch, and submit a pull request!

```bash
# First get up to date
$ git checkout master        # Go back to master branch
$ git pull origin master     # Fetch latest version
$ git sweep                  # Get rid of merged branches
$ bundle install             # Maybe the guys changed the Gemfile :)

# Open another terminal, and create a branch to work in
$ git checkout -b your-new-feature  # Please choose a descriptive name
$ stt  # Open sublime text and work.

# Done? Great!
$ git status
$ git add .  # Git add the stuff you changed
$ git commit -m "a descriptive message about your change"
$ git push origin your-new-feature  # push YOUR branch
# Then go to GitHub and open a pull-request
```
```bash
# In case of conflict
$ git checkout master
$ git pull origin master
$ git checkout mabranche
$ git merge master
$ git status -> regler les conflits
$ git add .
$ git commit -m "c'est ouf"
$ git push origin mabranch --> merge ok
```
