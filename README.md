## 5Z1

# 3E.

a. Aby skonfigurować pulę adresową dla podsieci na moście bridge2 należy wykorzystać polecenie ```iptables -I DOCKER-USER -m iprange -i bridge2 ! --src-range (from_address)-(to_address) -j DROP```.

b. Kontenery D2 i S1 nie mogą wykorzystać mechanizmu dynamicznego przypisywania adresów (DHCP). Aby skonfigurować sieć do działania w ten sposób należy utworzyć docker network na macvlan albo ipvlan driver, a następnie skorzystać z DHCP IPAM driver.

## 5Z3

# 1.

Nie można używać aliasów do komunikacji pomiędzy kontenerami przyłączonymi do dwóch różnych sieci.
Zarówno ```--network-alias``` jak i ```--alias``` nadają 'network-scoped alias', czyli alias o zasięgu tylko obecnej sieci.

# 2E.

Niemożliwe jest korzystanie ze zdefiniowanych aliasów na hoście macierzystym przy połączeniach do kontenerów. Aliasy nie mają żadnego wpływu na hosta macierzystego, obowiązują one tylko w wyznaczonej sieci w trybie bridge i dostępne są tylko z kontenerów.
