C:

cd C:\Program Files\FlightGear 2020.3

SET FG_ROOT=C:\Program Files\FlightGear 2020.3\data
SET FG_SCENERY=C:\Program Files\FlightGear 2020.3\data\Scenery;C:\Program Files\FlightGear 2020.3\Scenery;C:\Users\surya\FlightGear\Custom Scenery;C:\Users\surya\FlightGear\Downloads\TerraSync

.\\bin\fgfs --aircraft=f-14b --fdm=null --enable-auto-coordination --enable-clouds3d --native-fdm=socket,in,30,localhost,5502,udp --fog-nicest --enable-hud --start-date-lat=2004:06:01:4:00:00 --enable-sound --visibility=47000 --in-air --prop:/engines/engine0/running=true --disable-freeze --airport=PHTO --runway=15 --altitude=1000 --heading=0 --offset-distance=0 --offset-azimuth=0 --enable-rembrandt