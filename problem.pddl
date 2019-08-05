;;!pre-parsing:{type: "nunjucks", data: "info.json"}

(define (problem complete-jobs) (:domain agents-in-the-city)

(:objects 
    ; initialising all trucks
    {% for truck in data.agents.trucks %}
        {{ truck.name }} - truck 
    {% endfor %}

    ; initialising all motorcycles
    {% for motorcycle in data.agents.motorcycles %}
        {{ motorcycle.name }} - motorcycle
    {% endfor %}

    ; initialising all drones
    {% for drone in data.agents.drones %}
        {{ drone.name }} - drone
    {% endfor %}

    ; initialising all cars
    {% for car in data.agents.cars %}
        {{ car.name }} - car
    {% endfor %}

    ; initialising all items
    {% for item in data.items %}
        {{ item.name }} - item
    {% endfor %}

    ; initialising all workshops
    {% for workshop in data.workshops %}
        {{ workshop.name }} - workshop
    {% endfor %}

    ; initialising all storages
    {% for storage in data.storages %}
        {{ storage.name }} - storage
    {% endfor %}

    ; initialising all resource nodes
    {% for node in data.resource_nodes %}
        {{ node.name }} - resourceNode
    {% endfor %}


    sh0 sh1 sh2 sh3 sh4 sh5 sh6 - shop
)

(:init
    ;todo: put the initial state's facts and numeric values here

    ; resourcenodes containing item
    ; initialising all items in resource nodes
    {% for node in data.resource_nodes %}
        (item-in-resourceNode {{ node.item }} {{ node.name }})
    {% endfor %}
    

    (assembly-require-part item9 item4)  ; i9 requires i4 to be assembled
    (assembly-require-part item9 item1)
    (assembly-require-part item9 item0)
    (assembly-require-part item9 item2)
    (assembly-require-part item9 item3)
    
    ; specifying that an agent doesn't have any items
    {% for truck in data.agents.trucks %}
        {% for item in data.items %}
            (= (agent-used-capacity {{ truck.name }} {{ item.name }}) 0)  
        {% endfor %}
    {% endfor %}

    {% for motorcycle in data.agents.motorcycles %}
        {% for item in data.items %}
            (= (agent-used-capacity {{ motorcycle.name }} {{ item.name }}) 0)  
        {% endfor %}
    {% endfor %}

    {% for drone in data.agents.drones %}
        {% for item in data.items %}
            (= (agent-used-capacity {{ drone.name }} {{ item.name }}) 0)  
        {% endfor %} 
    {% endfor %}

    {% for car in data.agents.cars %}
        {% for item in data.items %}
            (= (agent-used-capacity {{ car.name }} {{ item.name }}) 0)
        {% endfor %}
    {% endfor %}
       

    ; initial location of the agents
    (agent-at-facility truck1 storage0)
    (agent-at-facility truck2 storage1)
    (agent-at-facility truck3 storage2)
    (agent-at-facility truck4 storage3)
    

    (agent-at-facility motorcycle1 storage2)
    

    
)

(:goal (and
    ;(job-complete s0 i9)
    (agent-carrying-item truck4 item9)
    ;todo: put the goal condition here
    )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
