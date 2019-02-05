title: Large-Scale Road Network Simulations for Smart Cities
shorttitle: S9387 GTC 2019
authors: Peter Heywood, Paul Richmond
institute: The University of Sheffield
class: animation-fade
layout: true


.bottom-bar[
  {{shorttitle}}
]


---

class: impact

# {{title}}
## {{authors}}
### {{institute}}
.uni-logo[
![The University of Sheffield Logo](img/tuoslogo_cmyk_hi.jpg)
<!-- ![The University of Sheffield Logo](img/tuoslogo_key_cmyk_hi.jpg) -->
]

---

class: impact
# Smart City Simulation

---
# Transport Network Demand
.col-6[
+ Designing and Managing transport networks is becoming mode difficult
+ Global transport demand is increasing <!-- @todo - cite -->
    + Across all modes of transport
    + **@todo - Road statistic**
    + **@todo - Rail statistic**
    + **@todo - Air statistic**
+ New Modes of transport appearing
    + I.e Connected Autonomous Vehicles (CAVs)
]
.col-6.img-col[
![Smart Motorway Congestion](img/highways-england-smart-motorway.jpg)
.caption[
[CC BY 2.0](http://creativecommons.org/licenses/by/2.0/)
Highways England 

[https://www.flickr.com/photos/highwaysagency/9950013283/](https://www.flickr.com/photos/highwaysagency/9950013283/)
]
]

---

# Smart Cities
.col-6[
+ Cities present additional challenges
+ High population density
+ Co-located modes of transport
+ Limited space


+ Cannot build new roads to increase capacity
+ Need to increase utilisation
    + **Improve planning**
    + **Active management**


+ Achieved through **Simulation**

]
.col-6.img-col[
.w-90[
![Transport Network](img/sheffield-map-smaller.png)
]
]


---

# Transport Network Simulations
.col-6[
+ Can be simulated at different **resolutions**
+ **Macroscopic**
    + Simulate aggregate flows across links
    + Top-down
    + *Low level of detail*
    + *Lowest computational cost*
+ **Mesoscopic**
    + Simulate platoons consisting of multiple vehicles
    + Mid-level
+ **Microscopic**
    + Simulate individual vehicles or people
    + Bottom-up
    + *High level of detail*
    + *Very high computational cost*
]
.col-6.img-col[
.w-90[
![Transport Network](img/sheffield-map-smaller.png)
]
]

???
@todo new picture

---

# Transport Network Simulations
.col-6[
+ Smart City Simulations are massively computationally expensive
    + **Large** 
        - City-scale, National-scale
    + **Complex** 
        - Smarter Infrastructure
        - Multiple Modes
    + **Many Permutations** 
        - Weather, Demand, etc.


+ Performance is limiting the use of simulation in industry <!-- [cite] --> <!-- @todo -->
+ **Faster simulators are required** 
]
.col-6.img-col[
.w-90[
![Transport Network](img/sheffield-map-smaller.png)
]
]

???
@todo new picture

---

class: impact
# Road Network Microsimulation



---

# Microscopic Simulation

.col-6[
+ Bottom-Up Simulation
+ Individual Vehicles
    + Own properties and behaviour
    + Interact with others
    + Interact with environment

+ Can be implemented with Agent Based Modelling (ABM) <!-- @todo cite -->
    + Intuitive method of describing models
    + Complex behaviour emerges from simple rules

+ **Huge computational cost**
+ Large volumes of data required
+ Highly Stochastic
    + Many runs required
]
.col-6.img-col[
.w-90[

<!-- ![Label](img/file.png) -->
*@todo - image*
]
]

---

# Commercial Microsimulation tools

.col-6[
+ Many commercial and open source simulators
    + Aimsun
    + Vissim
    + Parasim
    + SUMO
    + ... <!-- @todo cite / links -->
+ All CPU-based simulators
    + Single-threaded or Multi-threaded
+ Poor scaling with processor cores
+ Poor scaling with transport network size
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - image of CPU Scaling in Aimsun.*
]
]

---

# Our Goals / Aims (@todo rename this slide.)

.col-6[
+ Demonstrate GPUs are suitable for Smart-City Simulations
    + Suitable for large-scale networks
    + Offer better-than-real-time performance

+ Achieved this by:
    + Implement subset of models from a commercial tool
    + Cross-validate GPU implementation
    + Benchmark using a scalable model
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - image of GPUs?*
]
]


---

# CPU Simulator - Aimsun

.col-6[
+ Aimsun 8.1
+ Multi-core CPU simulator
+ Used Globally within transport industry
+ Capable of modelling almost any transport scenario

+ Diminishing returns above 8 CPU cores
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - Aimsun images*
www.aimsun.com
]
]

---

# Benchmark Models

.col-6[
+ Several models implemented
+ Gipps' Car Following Model
+ Aimsun Gap Acceptance Model
+ Turning Probability routing
+ Simulated Detectors
+ Constant Vehicle Arrival
+ Yellow-box junctions
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - image*
]
]

---

# Procedurally Generated Network

.col-6[
+ Manhattan-style grid network
+ Single lane, one-way roads
+ Stop-signs at junctions
+ Entrances and exits at the edges of the simulation
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - Grid network images*
]
]

---

# Aimsun Benchmarking

.col-6[
+ Benchmarked Aimsun 8.1 at multiple scales
+ Intel i7-4770k
+ Simulations contained up to 0.5 million vehicles
+ Longest simulation took **@todo**
    + **Slower than real time**
    + Not suitable for active management
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - CPU Performance*
]
]

---

class: impact
# GPU Microsimulation

---

# @todo

.col-6[
+ 
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - image*
]
]


---

# FLAME GPU
+ What / Why.
+ Other Uses / Images
+ See OERC


---

# FLAME GPU
+ Process. Code snippets?
+ See OERC

---

# FLAME GPU Implementation

+ State diagram


# Validation

+ Descirbe the validations we ran. 
+ Diagrams of the figure / Throw out some numbers.
+ @todo - gipps model validation is seconds not iterations.

---

# FLAME GPU Early Performance

+ Gridsize benchmark with Spatial Comm. Two slides / Transition.
+ See OERC

<!-- -- -->

---

# FLAME GPU Communication

+ Explain comms.
+ Brute + Spatial
+ Not well suited to dense transport networks
+ See OERC

---

# Graph Based Communication
+ New Comm strategy in FLAME GPU 1.5
+ See OERC 15

---

# Graph Based Communication 2
+ New Comm strategy in FLAME GPU 1.5
+ See OERC 16


---

# Graph Based Communication Performance
+ New Comm strategy in FLAME GPU 1.5
+ See OERC 17


---

# Grid size performance

+ Gridsize CPU plot, followed by Graph comm.
+ Followed by with multiple GPUs
+ Include speedup numbers.


---

# Per iteration Runtime

+ Figure showing per iteration runtime. 
+ OERC Backup slide.

---

# Input Flow Benchmarks

+ 64 CPU 

--

+ 64 CPU + GPUs

---

# Input Flow Benchmarks

+ 128 CPU 

--

+ 128 CPU + GPUs

---

# Input Flow Benchmarks

+ 256 CPU 

--

+ 256 CPU + GPUs

---

class: impact 
# Future Work

---

# Expand Functionality / More complete road network simulation.

+ Only implemented a subset of functionality
+ Add support for multiple lanes
+ Broader pieces of infrastructure
+ Performance improvements
+ Support real-world model and benchmarks.


---

# Multi-Mode GPU Simulation (Ped)

+ Model multiple modes of transport concurrently on GPUs
+ I.e Pedestrians - already on GPU
+ Video of peds form northmost?

---

# Multi-Mode GPU Simulation (Ped + Rail)

+ Rail - CPU is good enough (S2AM)
+ S2AM Video
+ Namedrop Siemens, Rob and Paul.

---

# Deep Learning

+ Train DL to predict simulator output
+ Shout out for James.
+ Compliment real world data with simulated data for un-observed situations
+ @todo - Ask James about his work. 


---

# FLAME GPU 2

+ New version of FLAME GPU
+ Currently under development
+ Increased Flexibility
+ Improved performance 
+ Parameter explorations, etc.
+ Python bindings
+ ... 
 
---


# Conclusion

+ @todo - OERC Conclusion

---

# Thank You

.smaller[
.col-4[
#### Contact
+ Peter Heywood
    + p.heywood@sheffield.ac.uk
    + [ptheywood.uk](http://ptheywood.uk)


+ Paul Richmond
    + p.richmond@sheffield.ac.uk
    + [paulrichmond.shef.ac.uk](http://paulrichmond.shef.ac.uk)


+ RSE Sheffield
    + http://rse.shef.ac.uk/

.w-70[
![RSE Sheffield](img/rse-sheffield-logo.png)
]
]
.col-7.offset-1[
#### Supported by
+ EPSRC fellowship “Accelerating Scientific Discovery with Accelerated Computing” (EP/N018869/1)
+ DfT Transport Technology Research Innovation Grant (T-TRIG July 2016)

#### More Information

+ "Data-parallel agent-based microscopic road network simulation using graphics processing units" 
    
    Heywood et al. 2017

    [doi.org/10.1016/j.simpat.2017.11.002](https://doi.org/10.1016/j.simpat.2017.11.002)

]
]


---
class: impact

# Additional Slides


---

# @todo layout
.col-6[
+ 
]
.col-6.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - image*
]
]

---
