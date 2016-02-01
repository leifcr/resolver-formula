#####################################
##### Salt Formula For Resolver #####
#####################################

# Resolver Configuration
resolv-base-file:
  file.managed:
    - name: /etc/resolvconf/resolv.conf.d/base
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://resolver/files/resolv.conf
    - template: jinja
    - defaults:
        nameservers: {{ salt['pillar.get']('resolver:base:nameservers', ['8.8.8.8','8.8.4.4']) }}
        searchpaths: {{ salt['pillar.get']('resolver:base:searchpaths', [salt['grains.get']('domain'),]) }}
        options: {{ salt['pillar.get']('resolver:base:options', []) }}
        domain: {{ salt['pillar.get']('resolver:base:domain', [salt['grains.get']('domain'),]) }}

resolv-head-file:
  file.managed:
    - name: /etc/resolvconf/resolv.conf.d/head
    - user: root
    - group: root
    - mode: '0644'
    - source: salt://resolver/files/resolv.conf
    - template: jinja
    - defaults:
        nameservers: {{ salt['pillar.get']('resolver:head:nameservers', []) }}
        searchpaths: {{ salt['pillar.get']('resolver:head:searchpaths', []) }}
        options: {{ salt['pillar.get']('resolver:head:options', []) }}
        domain: {{ salt['pillar.get']('resolver:head:domain', []) }}
