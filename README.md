# ebuilds
My ebuilds

To use them using current portage, check out the git repo
and add the following to e.g. */etc/portage/repos.conf/oleid*:

    [oleid]
    location = /usr/local/overlays/oleid
    sync-type = git
    sync-uri = https://github.com/oleid/ebuilds.git
    auto-sync = yes

Replace the location with the actual path to which you checked it out. For further reference, have a look at [the Gentoo wiki](https://wiki.gentoo.org/wiki/Project:Portage/Sync).
