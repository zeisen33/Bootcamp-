json.array! @benches do |bench|
    json.set! :title, bench.title
    json.set! :description, bench.description 
    json.set! :price, bench.price
    json.set! :seating, bench.seating
    json.set! :lat, bench.lat
    json.set! :lng, bench.lng
end