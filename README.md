# vagrant-barman
Vagrantfile for creation virtual machines with postgresql and barman (mostly for testing purposes).

# How to Build
Here is an example:

    vagrant up
    vagrant ssh pgsql1

Generate some data in pgsql1 db:

    create table t_random as select s, md5(random()::text) from generate_Series(1,100000) s;

Go to barman host and take backup:

    vagrant ssh barman
    sudo barman backup pgsql-1
