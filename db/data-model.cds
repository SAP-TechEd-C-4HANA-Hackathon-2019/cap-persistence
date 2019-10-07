namespace my.storesensing;
using { Currency, cuid, managed } from '@sap/cds/common';

entity PaxDevices {
  key ID : String;
  store : Association to one Stores;
};

entity Stores {
  key ID : Integer;
  paxdevice : Association to PaxDevices;
  town : String;
  latitude : String;
  longitude : String;
  currentVisitorCount : Integer;
};

entity VisitorCounts : cuid, managed {
  paxdevice : Association to PaxDevices;
  visitorCount  : Integer;
};

entity Orders : cuid, managed {
  store   : Association to Stores;
  amount  : Integer;
  currency : Currency;
  ccOrderID :String;
};