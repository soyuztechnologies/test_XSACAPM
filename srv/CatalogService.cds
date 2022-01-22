using { anubhav.db.master, anubhav.db.transaction, anubhav.db.CDSView, CV_PURCHASE } from '../db/datamodel';


service CatalogService@(path:'/CatalogService') {

    function sleep() returns Boolean;

    entity EmployeeSet as projection on master.employees;

    entity AddressSet as projection on master.address;

    entity ProductSet as projection on master.product;

    entity BPSet as projection on master.businesspartner;

    entity POs @(
        title: '{i18n>poHeader}'
    ) as projection on transaction.purchaseorder{
        *,
        Items: redirected to POItems
    }

    entity POItems @( title : '{i18n>poItems}' )
    as projection on transaction.poitems{
        *,
        PARENT_KEY: redirected to POs,
        PRODUCT_GUID: redirected to ProductSet
    }

    entity POWorklist as projection on CDSView.POWorklist;
    entity ProductOrders as projection on CDSView.ProductViewSub;
    entity ProductAggregation as projection on CDSView.CProductValuesView excluding{
        ProductId
    };

    entity PurchaseOrders as projection on CV_PURCHASE;

}