require 'pickle_jar'
require 'simple_test'

PJ = PickleJar
ST = SimpleTest

ST.testing "PickleJar should namecase all names"
ST.e( PJ.namecase('AARON'), 'Aaron')
ST.e( PJ.namecase('bILLY bOb'), 'Billy Bob' )
ST.e( PJ.namecase('WooT'), 'Woot' )
ST.e( PJ.namecase('all lower'), 'All Lower' )

ST.testing "PickleJar should add name(s) without duplicates"
PJ.add_name('AARON')
ST.e( PJ.peek_in_jar, ['Aaron'] )
PJ.add_names(['AARON', "Adam", "Joesph"])
ST.e( PJ.peek_in_jar, ['Aaron', "Adam", "Joesph"] )
PJ.add_names("AARON, Jeff R, Jeff D")
ST.e(PJ.peek_in_jar, ['Aaron', "Adam", "Joesph", "Jeff R", "Jeff D"])
PJ.add_names("AARON")
ST.e( PJ.peek_in_jar, ['Aaron', "Adam", "Joesph", "Jeff R", "Jeff D"] )

ST.testing "Test Empty function"
ST.e( PJ.peek_in_jar.length, 5 )
PJ.empty
ST.e( PJ.peek_in_jar.length, 0 )


ST.testing "PickleJar should remove name(s)"
PJ.add_names ['Aaron', "Adam", "Joesph", "Jeff R", "Jeff D"]
ST.e( PJ.peek_in_jar.length, 5 )
PJ.remove_name('AARON')
ST.e( PJ.peek_in_jar.length, 4 )
ST.e( PJ.peek_in_jar, ["Adam", "Joesph", "Jeff R", "Jeff D"] )
PJ.remove_names(['AARON', "Adam", "Jeff R"])
ST.e( PJ.peek_in_jar, ["Joesph", "Jeff D"] )

ST.testing "PickleJar should remove name after it is drawn"
PJ.empty
PJ.add_names ['Aaron', "Adam", "Joesph", "Jeff R", "Jeff D"]
ST.e( PJ.peek_in_jar.length, 5 )
PJ.winner_is
ST.e( PJ.peek_in_jar.length, 4 )
PJ.winner_is
ST.e( PJ.peek_in_jar.length, 3 )

ST.testing "PickleJar should inform you if it is empty when drawing a winner"
PJ.empty
ST.e( PJ.winner_is, "The Pickle Jar is empty..." )

ST.summary
