@benches.each do |bench|
    # debugger
    json.set! bench.id do 
        json.set! :title, bench.title
        json.set! :id, bench.id
        json.set! :description, bench.description 
        json.set! :price, bench.price
        json.set! :seating, bench.seating
        json.set! :lat, bench.lat
        json.set! :lng, bench.lng
    end

    # json.title bench.title
    # json.description bench.description 
    # json.price bench.price
    # json.seating bench.seating
    # json.lat bench.lat
    # json.lng bench.lng

    # json.partial! 'api/benches/bench'
end