//module.exports = srv => {
module.exports = async function(srv) {

    const { Stores, VisitorCounts } = srv.entities

    srv.after('CREATE', VisitorCounts, async function (vc) {

        let visitorCount = vc.visitorCount
        let paxdevice_ID = vc.paxdevice_ID;
        console.log(visitorCount);

        let store_id_array = await cds.run(SELECT.from(Stores).where({ paxdevice_ID: paxdevice_ID }));
        console.log(store_id_array);
        let store_id = store_id_array[0].ID;
        console.log(store_id);
        const ctx = cds.transaction(vc);
        return await
            ctx.run(
                UPDATE(Stores).set({ currentVisitorCount: visitorCount }).where({ ID: store_id })
            )
    });

}