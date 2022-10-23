const client = new Mongo();
const database = client.getDB("statistics")
const statistics = database.getCollection("statistics")

// bucket, action, origin, brand, category
// bucket, action, origin brand
// bucket, action, origin
// bucket, action
statistics.createIndex(
    {"bucket": -1, "action": 1, "origin": 1, "brandId": 1, "categoryId": 1}
)

// bucket, action, brand, category
// bucket, action, brand
statistics.createIndex(
    {"bucket": -1, "action": 1, "brandId": 1, "categoryId": 1}
)

// bucket, action, origin category
statistics.createIndex(
    {"bucket": -1, "action": 1, "origin": 1, "categoryId": 1}
)

// bucket, action, category
statistics.createIndex(
    {"bucket": -1, "action": 1, "categoryId": 1}
)
