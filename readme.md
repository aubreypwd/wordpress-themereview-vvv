# A WordPress Theme Reviewers VVV

This is an [auto-sitesetup](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Auto-site-Setup) designed to be used with [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV) for reviewing WordPress.org themes.

## To get started:

1. Clone this branch of this repo into the `www` directory of your Vagrant as `www/theme-review`
2. If your Vagrant is running, from the Vagrant directory run `vagrant halt`
3. Followed by `vagrant up --provision`.  Perhaps a cup of tea or coffee now? The provisioning may take a while

Then you can visit [http://themereview.wordpress.dev](http://themereview.wordpress.dev) to start developing or reviewing themes.

## To start over (review another theme):

You can use (I know it's long, Textexpander?) `vagrant ssh -c 'cd /home/vagrant/www/wordpress-themereview-vvv/ && rm -Rf htdocs/ && sh vvv-init.sh'` to do it and not reset your Vagrant. Or, you can always `vagrant reload --provision` and get a cup of coffee.

## Dependencies

- [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV) - [Installation guide](https://github.com/Varying-Vagrant-Vagrants/VVV#the-first-vagrant-up)
- [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) - Install with `vagrant plugin install vagrant-hostsupdater`

## What will happen?

- Install WordPress and import "Theme Unit Test Data"
- Install & activate "Developer"
- Install & activate "Theme Check"
- Install & activate "Theme Mentor"
- Install & activate "Theme Checklist"
- Install & activate "What The File"
- Install & activate "VIP Scanner"
- Install & activate "WordPress Database Reset"
- Install & activate "Toolbar Theme Switcher"
- Install "RTL Tester"
- Install "Pig Latin"
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

## 1.1

- Merged in smartness from [grappler/theme-review/](https://github.com/grappler/theme-review/)
- Now you can add `.zip` files in the root and they will install at provisioning time

## 1.0

- The old VVV theme review