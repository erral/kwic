generic
   type Osagai is limited private;
   with procedure Osagaia_Kopiatu (O1 : out Osagai; O2 : in Osagai);
   with function "=" (O1, O2 : in Osagai) return Boolean;
   type Gako is limited private;   -- bilaketa-gakoaren mota
   with function Gako_Berdinak (K1, K2 : in Gako) return Boolean;
   with function Gakoa (O : in Osagai) return Gako;
   with function Aurretik (K1, K2 : in Gako) return Boolean;
package Zuhaitzak is

   type Zuhaitz is limited private;
   type Ume is (Ezkerra, Eskuina);

   Zuhaitz_Hutsa : constant Zuhaitz;

   --Sarrera: Z2 zuhaitza
   --Irteera: Z1 zuhaitza, Z2-ren kopia dena
   --Eragina: Z2-ren kopia bat sortzen du Z1 zuhaitzean
   --Salbuespenak: Lekurik_Ez, kopiaketa egiteko memoriarik ez 
   --              baldin badago
   procedure Kopiatu (Z1 : out Zuhaitz;
                      Z2 : in Zuhaitz);

   --Sarrera:
   --Irteera: Z zuhaitz hutsa
   --Eragina: Z zuhaitz hutsa sortzen du
   procedure Hutsa_Sortu (Z : out Zuhaitz);

   --Sarrera: O osagaia, Z zuhaitza, U umea
   --Irteera: Z zuhaitz berria, non O erroa baita, eta sarrerako Z osoa
   --         U-k adierazitako umearen lekuan ezarri baita
   --Eragina: O osagaia ezartzen du eraikitako zuhaitz berriaren
   --         errotzat, U umean sarrerako zuhaitza utziz
   --Salbuespenak: Lekurik_Ez, eraikuntza egiteko memoriarik ez 
   --              baldin badago
   procedure Eraiki (O : in Osagai;
                     Z : in out Zuhaitz;
                     U : in Ume);

   --Sarrera: O osagaia, Z zuhaitza
   --Irteera: Z zuhaitz aldatua, non O baita erro berria
   --Eragina: O ezartzen du Z-ko erro berritzat
   --Salbuespenak: Hutsik_Dago, Z hutsa baldin bada
   procedure Erroa_Ezarri (Z : in out Zuhaitz;
                           O : in Osagai);

   --Sarrera: U umea, Z1 eta Z2 zuhaitzak
   --Irteera: Z1 zuhaitz aldatuko U umean sarrerako Z2 dago;
   --         Z2 berria, sarrerako Z1-eko U azpizuhaitza da
   --Eragina: Z1-eko U umea Z2-rekin trukatzen du
   --Salbuespenak: Hutsik_Dago, Z1 hutsa bada
   procedure Umea_Trukatu (Z1 : in out Zuhaitz;
                           U : in Ume;
                           Z2 : in out Zuhaitz);

   -- Sarrera: Z zuhaitza, O osagaia
   -- Irteera: Z zuhaitza, non O osagaia txertatu baita (Aurretik
   --          funtzioa gakoari aplikatuz) dagokion tokian.
   --          Osagaiaren gakoa errokoaren berdina bada, osagai
   --          berriak lehengoa ordezkatuko du; osagaiari errokoaren
   --          aurretik egotea tokatzen bazaio, ezkerreko 
   --          azpizuhaitzean txertatuko da errekurtsiboki;
   --          bestela, eskuinekoan txertatuko da errekurtsiboki
   -- Eragina: osagaia zuhaitzean txertatzen du dagokion lekuan,
   --          baita lehendik gako berdineko osagai bat baldin bazegoen
   --          ere (kasu horretan, berriak zaharra ordezkatzen du)
   -- Salbuespenak: Lekurik_Ez, memoriarik ez baldin badago
   procedure Txertatu_Ordenan (Z : in out Zuhaitz; O : in Osagai);

   
   -- Sarrera: Z zuhaitza, K gakoa
   -- Irteera: Aurkitua = True, Z-n K gakodun osagairik baldin badago
   --                   = False bestela
   --          O: Z-ko K gakodun lehen osagaia, Aurkitua = True bada
   -- Eragina: K gakodun lehen osagaia bilatzen du Z-n (Gakoa funtzioaz
   --          baliatuz, osagaiaren gakoa lortzeko), Txertatu_Ordenan
   --          eragiketan erabilitako txertatze-irizpide berari
   --          jarraituz
   procedure Bilatu_Ordenan (Z : in Zuhaitz;
                             K : in Gako;
                             O : out Osagai;
                             Aurkitua : out Boolean);

   --Sarrera: Z1 eta Z2 zuhaitzak
   --Irteera: True, Z1 eta Z2 berdinak badira;
   --         False, bestela
   --Eragina: bi zuhaitzen berdintasuna aztertzen du
   function Berdinak_Dira (Z1 : in Zuhaitz;
                           Z2 : in Zuhaitz) return Boolean;

   --Sarrera: Z zuhaitza
   --Irteera: True, Z hutsa bada;
   --         False, bestela
   --Eragina: Z zuhaitz hutsa denentz aztertzen du
   function Hutsa_Da (Z : in Zuhaitz) return Boolean;

   --Sarrera: Z zuhaitza
   --Irteera: Z-ren erroa
   --Eragina: Z-ren erroko osagaia itzultzen du
   --Salbuespenak: Hutsik_Dago, Z hutsa bada
   function Erroa (Z : in Zuhaitz) return Osagai;

   --Sarrera: Z zuhaitza, U umea
   --Irteera: Z-ren U umea
   --Eragina: Z-ren U umea itzultzen du
   --Salbuespenak: Hutsik_Dago, Z hutsa bada
   function Umea (Z : in Zuhaitz;
                  U : in Ume) return Zuhaitz;

   Lekurik_Ez : exception;
   Hutsik_Dago : exception;

private
   type Adabegi;
   type Zuhaitz is access Adabegi;
   Zuhaitz_Hutsa : constant Zuhaitz := null;
end Zuhaitzak;