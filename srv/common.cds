using {ag.db as db} from '../db/schema';

service StoreService {
    entity Store as projection on db.Store;
    entity Item  as projection on db.Item;
    entity Bill  as projection on db.Bill;
}