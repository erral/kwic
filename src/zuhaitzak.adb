package body Zuhaitzak is

   type Adabegi is
      record
         Erroa : Osagai;
         Ezkerrekoa : Zuhaitz;
         Eskuinekoa : Zuhaitz;
      end record;

   procedure Kopiatu (Z1 : out Zuhaitz;
                      Z2 : in Zuhaitz) is
   begin
      if Z2 = null then
         Z1 := null;
      else
         Z1 := new Adabegi;
         Osagaia_Kopiatu (Z1.Erroa, Z2.Erroa);
         Z1.Ezkerrekoa := null;
         Z1.Eskuinekoa := null;
         Kopiatu (Z1.Ezkerrekoa, Z2.Ezkerrekoa); --errekurtsiboki
         Kopiatu (Z1.Eskuinekoa, Z2.Eskuinekoa); --errekurtsiboki
      end if;
   exception
      when Storage_Error => raise Lekurik_Ez;
   end Kopiatu;

   procedure Hutsa_Sortu (Z : out Zuhaitz) is
   begin
      Z := null;
   end Hutsa_Sortu;

   procedure Eraiki (O : in Osagai;
                     Z : in out Zuhaitz;
                     U : in Ume) is
      Z_Lag : Zuhaitz := Z;
   begin
      Z := new Adabegi;
      Osagaia_Kopiatu (Z.Erroa, O);
      if U = Ezkerra then --ezkerrean eraiki
         Z.Ezkerrekoa := Z_Lag;
         Z.Eskuinekoa := null;
      else --eskuinean eraiki
         Z.Ezkerrekoa := null;
         Z.Eskuinekoa := Z_Lag;
      end if;
   exception
      when Storage_Error => raise Lekurik_Ez;
   end Eraiki;

   procedure Erroa_Ezarri (Z : in out Zuhaitz;
                           O : in Osagai) is
   begin
      Osagaia_Kopiatu (Z.Erroa, O);
   exception
      when Constraint_Error => raise Hutsik_Dago;
   end Erroa_Ezarri;

   procedure Umea_Trukatu (Z1 : in out Zuhaitz;
                           U : in Ume;
                           Z2 : in out Zuhaitz) is
      Z_Lag : Zuhaitz;
   begin
      if U = Ezkerra then
         Z_Lag := Z1.Ezkerrekoa;
         Z1.Ezkerrekoa := Z2;
      else
         Z_Lag := Z1.Eskuinekoa;
         Z1.Eskuinekoa := Z2;
      end if;
      Z2 := Z_Lag;
   exception
      when Constraint_Error => raise Hutsik_Dago;
   end Umea_Trukatu;

   procedure Txertatu_Ordenan (Z : in out Zuhaitz; O : in Osagai) is
   begin
      if Z = null then
         Eraiki (O, Z, Ezkerra);
      else
         if Gako_Berdinak (Gakoa (O), Gakoa (Z.Erroa)) then
            Osagaia_Kopiatu (Z.Erroa, O); -- osagaia ordezkatzen du           
         elsif Aurretik (Gakoa (O), Gakoa (Z.Erroa)) then
            Txertatu_Ordenan (Z.Ezkerrekoa, O);
         else
            Txertatu_Ordenan (Z.Eskuinekoa, O);
         end if;
      end if;
   exception
      when Storage_Error | Lekurik_Ez => raise Lekurik_Ez;
   end Txertatu_Ordenan;

   procedure Bilatu_Ordenan (Z : in Zuhaitz;
                             K : in Gako;
                             O : out Osagai;
                             Aurkitua : out Boolean) is
   begin
      if Z = null then
         Aurkitua := False;
      elsif Gako_Berdinak (K, Gakoa (Z.Erroa)) then
         Aurkitua := True;
         Osagaia_Kopiatu (O, Z.Erroa);
      elsif Aurretik (K, Gakoa (Z.Erroa)) then
         Bilatu_Ordenan (Z.Ezkerrekoa, K, O, Aurkitua);
      else 
         Bilatu_Ordenan (Z.Eskuinekoa, K, O, Aurkitua);
      end if;
   end Bilatu_Ordenan;

   function Berdinak_Dira (Z1 : in Zuhaitz;
                           Z2 : in Zuhaitz) return Boolean is
   begin
      if Z1.Erroa /= Z2.Erroa then
         return False;
      else
         return Berdinak_Dira (Z1.Ezkerrekoa, Z2.Ezkerrekoa) and then
                Berdinak_Dira (Z1.Eskuinekoa, Z2.Eskuinekoa);
      end if;
   exception
      when Constraint_Error => --bietako bat null da
         return Z1 = Z2; --biak null badira, True; bestela, False
   end Berdinak_Dira;

   function Hutsa_Da (Z : in Zuhaitz) return Boolean is
   begin
      return Z = null;
   end Hutsa_Da;

   function Erroa (Z : in Zuhaitz) return Osagai is
   begin
      return Z.Erroa;
   exception
      when Constraint_Error => raise Hutsik_Dago;
   end Erroa;

   function Umea (Z : in Zuhaitz;
                  U : in Ume) return Zuhaitz is
   begin
      if U = Ezkerra then
         return Z.Ezkerrekoa;
      else
         return Z.Eskuinekoa;
      end if;
   exception
      when Constraint_Error => raise Hutsik_Dago;
   end Umea;

end Zuhaitzak;