with Ada.Text_Io;
use Ada.Text_Io;
with Kontsultako_Hitzen_Zerrenda;
with Dokumentua;
with Hitzak;

procedure Kwica_Sortu is 
   H : Hitzak.Hitz;  
begin
   Dokumentua.Hasieratu;
   Kontsultako_Hitzen_Zerrenda.Eraiki;
   while not Kontsultako_Hitzen_Zerrenda.Hutsa_Da loop
      Kontsultako_Hitzen_Zerrenda.Hurrengo_Hitza_Lortu (H);
      Put(Hitzak.Balioa(H));
      Put_Line("-(r)en testuinguruak:");
      Dokumentua.Hitzaren_Testuinguruak_Inprimatu(H);
      Put_Line("Sakatu <return>");
      Skip_Line;
      Kontsultako_Hitzen_Zerrenda.Hitza_Kendu;
   end loop;
   Dokumentua.Bukatu;
exception
   when Dokumentua.Errorea_Ixtean =>
      Put_Line("Errorea gertatu da fitxategia ixtean");
      Put_Line("Sakatu <return>");
      Skip_Line;
   when Dokumentua.Errorea_Irekitzean =>
      Put_Line("Errorea gertatu da fitxategia irekitzean");
      Put_Line("Sakatu <return>");
      Skip_Line;
   when Dokumentua.Fitxategi_Ezezaguna =>
      Put_Line("Izen hori duen fitxategirik ez dago laneko katalogoan");
      Put_Line("Sakatu <return>");
      Skip_Line;
   when Dokumentua.Fitxategi_Handiegia =>
      Put_Line("Erabili nahi duzun fitxategia ez da memorian kabitzen");
      Put_Line("Probatu fitxategi txikiago batekin");
      Put_Line("Sakatu <return>");
      Skip_Line;
   when Dokumentua.Hasieratze_Okerra =>
      Put_Line("Sartu duzun hitzaren posizioa ez dago Posizio Taulan.");
      Put_Line("Hori dela eta, prozesuak ezin du jarraitu.");
      Put_Line("Jar ezazu programa martxan berriz.");
      Put_Line("Sakatu <return> amaitzeko");
      Skip_Line;
   when Kontsultako_Hitzen_Zerrenda.Lekurik_Ez =>
      Put_Line("Hitz gehiegi idatzi duzu");
      Put_Line("Sakatu <return>");
      Skip_Line;

end Kwica_Sortu;