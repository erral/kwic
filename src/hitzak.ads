package Hitzak is

   type Hitz is limited private; --Datu mota abstraktua pribatu egitea
   Lekurik_Ez: exception; 

   procedure Sortu (S: in String; H:out Hitz);
   --Aurrebaldintza: string ez huts bat
   --Postbaldintza: stringak osatzen duen hitza itzultzen du
   procedure Kopiatu (H: in Hitz; H1:out Hitz);
   --Aurrebaldintza: hitz ez huts bat
   --Postbaldintza: Emandako hitzaren kopia bat egiten du
   function Berdin (H1,H2: in Hitz) return Boolean;
   --Aurrebaldintza: Bi hitz
   --Postbaldintza: Bi hitzak berdinak badira 'true' itzuliko du, 'false' bestela
   function Balioa (H: in Hitz) return String;
   --Aurrebaldintza: Hitz bat
   --Postbaldintza: Hitz bat osatzen duen stringa itzultzen du
   function Luzera (H: in Hitz) return Natural;
   --Aurrebaldintza: Hitz bat
   --Postbaldintza: Hitz horren luzera itzultzen du
   function "<" (H1, H2: in Hitz) return Boolean;
   --Aurrebaldintza: Bi hitz
   --Postbaldintza: 'true' itzuliko du H1en balioa, ordena lexikografikoaren arabera, H2renaren
   --                aurretik badago, eta 'false' bestela

private
   type Hitz is access String; --Hitzaren definizioa string baten erakuslea erabiliz
end Hitzak;