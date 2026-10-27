using StoreService as service from '../../srv/common';
annotate service.Bill with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Number',
                Value : number,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Amount',
                Value : amount,
            },
            {
                $Type : 'UI.DataField',
                Value : transactionId.items.currency_code,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Value : transactionId.items.price,
                Label : 'Price',
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID : 'ItemDetails',
            Target : '@UI.FieldGroup#ItemDetails',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Transaction Id',
            Value : number,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Total Amt',
            Value : amount,
        },
        {
            $Type : 'UI.DataField',
            Value : transactionId.items.itemName,
            Label : 'Item Name',
        },
        {
            $Type : 'UI.DataField',
            Value : transactionId.items.ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : transactionId.items.quantity,
            Label : 'Quantity',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon
        },
        {
            $Type : 'UI.DataField',
            Value : transactionId.items.status_code,
            Label : 'Status',
            Criticality : status.criticality
        },
    ],
    UI.SelectionFields : [
        amount,
    ],
    UI.HeaderInfo : {
        TypeName : 'Bill',
        TypeNamePlural : 'Bills',
        Title : {
            $Type : 'UI.DataField',
            Value : transactionId.storeName,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : 'Transactions',
        },
        TypeImageUrl : 'sap-icon://monitor-payments',
    },
    UI.FieldGroup #ItemDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : transactionId.storeName,
                Label : 'Store Name',
            },
            {
                $Type : 'UI.DataField',
                Value : transactionId.items.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : transactionId.items.itemName,
                Label : 'Item Name',
            },
            {
                $Type : 'UI.DataField',
                Value : transactionId.items.quantity,
                Label : 'Quantity',
            }
        ],
    },
);

annotate service.Bill with {
    transactionId @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Store',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : transactionId_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'storeName',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'location',
            },
        ],
    }
};

annotate service.Bill with {
    amount @(
        Common.Label : 'Total Amount',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Bill',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : amount,
                    ValueListProperty : 'amount',
                },
            ],
            Label : 'Total Amount',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Item with {
    currency @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Currencies',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : currency_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Currency',
        },
        Common.ValueListWithFixedValues : true,
)};

