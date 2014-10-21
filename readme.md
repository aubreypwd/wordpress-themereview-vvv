This is a [VarryingVagrantVagrant](https://github.com/Varying-Vagrant-Vagrants/VVV)
for testing WordPress Themes.

# How to install this VarryingVagrantVagrant

Clone this repo, or [download it](https://github.com/aubreypwd/wordpress-themereview-vvv/releases),
into your `www/` folder and re-provision your VVV using `vagrant provision`

# What will happen?

Also, check out the `vvv-*` scripts for what will happen.
______________

This will create a `/vagrant-install/www/wordpress-themereview/htdocs`
folder with a fresh WordPress install.

The data base `wordpress_themereview` will be automatically created for you.
It will also check out the [developer](http://wordpress.org/plugins/developer/)
and [theme-check](http://wordpress.org/plugins/theme-check/) plugins and activate them for you
as well as install the [Theme Unit Test](http://codex.wordpress.org/Theme_Unit_Test) data.

You can then go to [http://themereview.wordpress.dev](http://themereview.wordpress.dev),
upload and install a theme and review away.

Just delete the `htdocs` folder when you want to start over.

## WordPress Login Creds

You can login with `admin`, which has the password `password`

# Changelog

## 1.1

- Theme Unit Data is dynamic thanks to @RCowles