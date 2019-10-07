using { my.storesensing as my, sap.common } from '../db/data-model';

service StoreService {
  entity PaxDevices as projection on my.PaxDevices;
  entity Stores as projection on my.Stores;
  entity VisitorCounts as projection on my.VisitorCounts;
  entity Orders as projection on my.Orders;
}