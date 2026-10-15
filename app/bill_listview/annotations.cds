using StoreService as service from '../../srv/common';
annotate service.Bill with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'number',
                Value : number,
            },
            {
                $Type : 'UI.DataField',
                Label : 'amount',
                Value : amount,
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
    ],
    UI.SelectionFields : [
        amount,
    ],
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
    amount @Common.Label : 'Total Amount'
};

