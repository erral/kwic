package Posizioak is

   subtype Posizio is Positive;

   procedure Kopiatu (P1: in Posizio; P2: out Posizio);
   --Post: P2-n P1en edukia kopiatzen du
   function Txikiago (P1,P2: in Posizio) return Boolean;
   function Handiago (P1,P2: in Posizio) return Boolean;
   function Berdin (P1,P2: in Posizio) return Boolean;
   function Esan_Posizio (P:in Posizio) return Posizio;
end Posizioak;