using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(
    UI.SelectionFields:[
        PO_ID,
        GROSS_AMOUNT,
        Currency_code,
        OVERALL_STATUS
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : Currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type: 'UI.DataFieldForAction',
            Label: 'Boost',
            Action: 'CatalogService.boost',
            Inline: true
        },
        {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
                Criticality : Criticality,
                CriticalityRepresentation: #WithIcon
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY
        }
    ],
    UI:{
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order',
            TypeNamePlural : 'Purchase Orders',
            Title: { Label : 'Purchase Order Id', Value: PO_ID },
            Description: { Label : 'Vendor', Value: PARTNER_GUID.COMPANY_NAME },
            ImageUrl: 'https://static.wixstatic.com/media/74c3a1_d23c9389ba744c62b9883118b5b8eb74~mv2.png/v1/fill/w_160,h_158,al_c,q_85,usm_0.66_1.00_0.01/atsv1.webp'
        },
    }
);
annotate service.POs with @(
    UI.FieldGroup #BasicDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Currency_code,
            },
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Label : 'NOTE',
                Value : NOTE,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CREATEDAT',
                Value : CREATEDAT,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MODIFIEDAT',
                Value : MODIFIEDAT,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#BasicDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Line Items',
            Target : 'Items/@UI.LineItem',
        }
    ]
);

annotate service.POItems with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.DESCRIPTION,
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID.PRICE,
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : Currency_code,
        }

    ]

);