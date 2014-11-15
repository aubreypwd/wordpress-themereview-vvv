# A WordPress Theme Reviewers VVV

This is an [auto-sitesetup](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Auto-site-Setup) designed to be used with [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV) for reviewing WordPress.org themes.

## To get started:

1. Clone this repo to your VVV/`www` folder
2. Update to a [release tag](https://github.com/aubreypwd/wordpress-themereview-vvv/releases) to keep stable
3. If your Vagrant is running, from the Vagrant directory run `vagrant halt` followed by `vagrant up --provision`.

Perhaps a cup of tea or coffee now? The provisioning may take a while.

Then you can visit [http://themereview.wordpress.dev](http://themereview.wordpress.dev) to start developing or reviewing themes.

## To start over (review another theme):

You can do it the soft way using (I know it's long, Text Expander?) `vagrant ssh -c 'cd /home/vagrant/www/wordpress-themereview-vvv/ && rm -Rf htdocs/ && sh vvv-init.sh'`. Or, you can do it the hard way `vagrant reload --provision` and get a cup of coffee.

## Dependencies

- [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV) - [Installation guide](https://github.com/Varying-Vagrant-Vagrants/VVV#the-first-vagrant-up)
- [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) - Install with `vagrant plugin install vagrant-hostsupdater`

## What will happen?

- Install WordPress and import "Theme Unit Test Data"
- Install a bunch of developer plugins you'll need
- Install any `.zip` themes located in the root

## Credentials and Such

### Theme Review

* Username: `admin`
* Password: `password`
* Login: [login](http://themereview.wordpress.dev/wp-admin)

### MySQL Root

* User: `root`
* Pass: `root`
* See: [Connecting to MySQL](https://github.com/varying-vagrant-vagrants/vvv/wiki/Connecting-to-MySQL) from your local machine

# Reviewing Themes

If you drop a theme's `.zip` file into the root folder (not htdocs) provisioning will automatically install the theme ready for activation.

Yes, drop six zip files and all six themes will install automagically.

_________________________

# Changelog

## 1.2.1

- Now you can use the quick way to reset everything and it will still import your theme `.zip`s

## 1.2

- Merged in smartness from [grappler/theme-review/](https://github.com/grappler/theme-review/)
- Now you can add `.zip` files in the root and they will install at provisioning time

## 1.1

- Theme Unit Data is dynamic thanks to @RCowles

## 1.0

- The old VVV theme review

_________________________

# Contributors

@aubreypwd @RCowles @grappler