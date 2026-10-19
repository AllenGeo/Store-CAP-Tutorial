using {
    cuid,
    managed
} from '@sap/cds/common';

namespace ag.db;

entity Item : cuid, managed {
    itemName : String;
    store    : Association to Store;
    quantity : Integer;
    status : Association to QuantityStatus;
}

entity QuantityStatus {
    key code : QuantityStatusCode;
    criticality : Integer;
    displayText : String;
}
type QuantityStatusCode : String(1) enum{
    Available = 'A';
    Low_Stock = 'L';
    Unavailable = 'U';
}

entity Store : cuid, managed {
    storeName : String;
    location  : String;
    items     : Association to many Item
                    on items.store = $self;
    Bill      : Composition of many Bill
                    on Bill.transactionId = $self;
}

entity Bill : cuid, managed {
        number        : Integer;
    key transactionId : Association to Store;
        amount        : Decimal(8, 2);
}
