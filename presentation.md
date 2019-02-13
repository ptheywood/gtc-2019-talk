title: Large-Scale Road Network Simulations for Smart Cities
shorttitle: S9387 - Large-Scale Road Network Simulations for Smart Cities
mainauthor: Peter Heywood
otherauthors: Paul Richmond, Steve Maddock, Rob Chisholm, James Pyle
institute: The University of Sheffield
class: animation-fade
layout: true


.bottom-bar[
.col-8[
{{shorttitle}}
]
.pull-right[
{{mainauthor}}, {{institute}}
]
]

<!-- @todo - steal stuff from pauls slides http://on-demand.gputechconf.com/gtc/2018/presentation/s8223-simulating-a-city-gpu-simulations-of-traffic-crowds-and-beyond.pdf -->
<!-- @todo talk ouitline slide. -->

---

class: impact

# {{title}}
## <span style="text-decoration: underline">{{mainauthor}}</span>, {{otherauthors}}
### {{institute}}

.bottom-bar[
{{shorttitle}}
.pull-right[{{mainauthor}}, {{institute}}]
]

---

class: impact
# Smart City Simulation

---

# Smart Cities

.col-6[
+ Data-driven transport management
+ **Improve** utilisation and efficiency etc.
+ **Reduce** congestion and pollution etc.
    

+ Transport demand is increasing <!-- @todo - cite -->
    + Across all modes of transport
    + **@todo - Road statistic**
    + **@todo - Rail statistic**
    + **@todo - Air statistic**
+ New modes of transport appearing
    + I.e Connected Autonomous Vehicles (CAVs)
]
.col-6.img-col[
.w-90[
![Transport Network](img/sheffield-map-smaller.png)
]
]

---

# Smart City Transport Simulation
.col-6[

+ Goals can be achieved through **simulation**
    + Planning
    + Management


+ Cities are challenging
    + High population density
    + Co-located modes


+ Limitations on possible interventions
    + Space
    + Air Quality
    + Money

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

# Transport Network Simulation Resolution
.col-7[
+ **Macroscopic** (Top-Down)
    + Simulate aggregate flows across links
    + *Low Resolution*
    + *Lowest Computational Cost*


+ **Mesoscopic**
    + Simulate platoons consisting of multiple vehicles


+ **Microscopic** (Bottom-up)
    + Simulate individual vehicles or people
    + *High Resolution*
    + *Very High Cost*
]
.col-5.img-col[
.w-80[
![Simulation Resolutions](img/macromicro.png)
]
]



---

# Computational Challenges
.col-6[
+ Smart city simulations are **massively** computationally expensive
    + *Millions* of individuals
    + Many modes of transport
    + Many permutations required
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
# CPU Microsimulation

+ @todo - subpoints

---

# Microsimulation and Agent Based Modelling
<!-- @todo - simplify the text. Less bullts. -->
.col-6[
+ Bottom-Up Simulation
+ Individual Vehicles
    + Own properties and behaviour
    + Interact with others
    + Interact with environment

+ Can be implemented with Agent Based Modelling (ABM)
    + Intuitive method of describing models
    + Complex behaviour emerges from simple rules

+ **Huge computational cost**
+ Large volumes of data required
+ Highly Stochastic
    + Many runs required
]
.col-6.img-col[
.w-90[
![Road Network Microsimulation](img/ttrig-screenshot.png)
.caption[FLAME GPU Road Network Microscopic Simulation]
]
]

---

# Commercial Microsimulation tools

.col-6[
+ Many commercial and open source simulators
    + Aimsun
    + PTV Vissim
    + Parasim
    + SUMO
    + etc.
+ All CPU-based simulators
    + Single-threaded or Multi-threaded
+ Poor scaling with processor cores
+ Poor scaling with transport network size
]
.col-6.img-col[
.w-90[
![Aimsun CPU Scaling](img/aimsun-performance-cpu-threads.png)
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
![Nvidia Titan Xp and Titan V](img/2-titan-xp-2-titan-v.jpg)
.caption[Nvidia Titan Xp and Titan V GPUs]
]
]


---

# Reference CPU Simulator

@todo - This slide needs to show that to achieve our goals we need to do something. What are we simulating. A standardised benchmark

.col-6[
+ Aimsun 8.1
+ Multi-core CPU simulator
+ Used Globally within transport industry
+ Capable of modelling almost any transport scenario

+ Diminishing returns above 8 CPU cores
]
.col-6.img-col[
.w-90[
.w-60[
![Aimsun Logo](img/aimsun-logo.png)
![Aimsun Logo](img/aimsun-tutorial-network.png)
]
www.aimsun.com
]
]

---

# Selected Microsimulation Models (@todo Standardised Benchmark / Control Models)

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

# Benchmark Network

.col-5.vcent-col[
+ Manhattan-style grid network
+ Single lane, one-way roads
+ Stop-signs at junctions
+ Entrances and exits at the edges of the simulation
]
.col-7.img-col[
.w-99[
![Scalable Grid Network](img/grid-with-zoom.png)
]
]

---

# Aimsun Benchmarking

.col-6[
+ Benchmarked Aimsun 8.1 at multiple scales
+ 1 hour simulation
+ Intel i7 4770k
+ Average runtime from 3 repetitions


+ Largest Simulation which ran to completion
    + ~ 0.5 million vehicles
    + 5447 seconds
    + **1.5x slower than real time**


+ **Too slow for real-time predictive management**
]
.col-6.img-col[
.w-99[
![Aimsun CPU Scaling](img/popsize-gridsize-cpu-linear.png)
]
]
<!-- @todo - linear or log -->

---

class: impact
# GPU Microsimulation

+ @todo Add bullets

---

# FLAME GPU
.col-6[

+ **F**lexible **L**arge-Scale **A**gent **M**odelling **E**nvironment for the **GPU**
+ Template-based simulation environment for high performance simulation
+ Agents (individuals) represented as X-Machines
    + with *message lists* for communication
+ Abstracts the CUDA programming model away from the user

]
.col-6.img-col[
.w-90[
.center.w-40[
!["FLAME GPU logo"](img/flamegpu-logo.jpg)
]

flamegpu.com

github.com/flamegpu/

**@todo Generic FLAME GPU images**
]
]


---

# FLAME GPU Code Generation Process

.col-12.img-col[
.w-70[
![FLAME GPU Code Generation](img/flamegpu-process-diagram.png)
]
]

+ **@todo - Add snippets of XML and C code from github?**


---

# Why use FLAME GPU?

.col-6[
+ State-based representation minimises divergence
+ SoA per state list - improves data access pattern
+ Message lists avoid race-conditions
    + Natural synchronisation barriers
+ Reduce global reads via shared memory
]
.col-6.img-col[
.w-90[
![FLAME GPU X machine diagram](img/xMachine.jpg)
]
]

---

# @todo overviewy slide linking advantages and state diagram - 

+ @todo - Repeat the selected models slide? 

---


# Implementation State Diagram

.col-9.img-col[
.w-99[
![FLAME GPU Road Network Simulation State Diagram](img/ttrig-state-diagram-cars.png)
]
]
<!-- .col-3.vcent-col[ -->
.col-3[
.smaller[
+ Vehicles only
+ 3 States
+ Represents 1 iteration
+ Functions within layer execute concurrently
]
]

---

<!-- Old Vis slide converted to validation -->
# Validation of GPU Implementation

.col-4[
+ Cross Validated against Aimsun 8.1
+ 6 sets of validation networks, targeting different models
    + Deterministic tests reproduced exactly
    + Stochastic test reproduced within acceptable range
]
.col-8.responsive[
<video width="1920" height="1080" controls loop muted poster="video/ttrig-1080p30.png">
    <source src="video/ttrig-1080p30.webm" type="video/webm">
  Your browser does not support the video tag.
</video>
<img src="video/ttrig-1080p30.png" class="video-poster" />
]

---

# Validation of GPU Implementation
.col-4[
+ Cross Validated against Aimsun 8.1
+ 6 sets of validation networks, targeting different models
    + Deterministic tests reproduced exactly
    + Stochastic test reproduced within acceptable range
]
.col-8.img-col[
.w-90[
![Label](img/aimsun-flame-stopsign.png)
.caption[Vadliation of Gipps' Car following model Scenario]
**@todo - Change X Label of this image! Time(s) not Iteration!**
]
]

<!-- @todo - remove FLAME GPU from titles where not needed. -->

---
class: impact

# Agent Communication

+ Existing Communication Strategies
+ Graph Based Communication
+ Benchmark Results

---

# FLAME GPU Communication

+ Message lists used to communicate
    + Avoids issues with concurrent access to agent memory
    + Enables good use of cache and memory hierarchy
+ Typically the performance-limiting factor in large-scale simulations
+ Specialisation for typical communication patterns <!-- \cite{Richmond2011b} -->
    + All-to-All
    + Discrete Partitioned Messaging  (2D Cellular Automata)
    + Spatially Partitioned Messaging (2D and 3D Continuous Agents)
+ Non-optimal for road network models


<!-- @todo an image?  -->
---


# FLAME GPU Communication Benchmarking

.col-4[
+ Benchmarked multiple scales using alternate communication strategies
+ NVidia Titan V
+ Average runtime from 3 repetitions
+ Poor Performance
+ **Majority of runtime spent iterating messages!**
+ **@todo - popsize-gridsize-brute-spatial-linear.png**
]
.col-8.img-col[
.w-90[
![Aimsun CPU Scaling](img/popsize-gridsize-brute-spatial-linear.png)
]
]

---

# Communication Between Vehicle Agents

.col-5[
+ Gipps' Car Following Model
+ \> Requires information from ^
<!-- @todo - include images. -->


+ I.e. based on the road network

]
.col-7.img-col[
<!-- + @todo - Version showing the target vehilce and the important information. -->
<!-- @todo key. -->
<img src="img/communication-diagram.svg" alt="Communication diagram" style="width:550px;" />
]

<!-- @todo - format tables to be at the bottom. Fixed and with the right height. -->
---

# Communication Example: All to All

.col-5[
+ Brute-Force Communication 


+ Each agent reads every message
+ Agent @todo reads **42** messages <!-- @ todo replace with key/icon -->


.commtable[
| Communication Strategy | # Messages | 
|------------------------|------------|
| All-to-all             |         42 |
]
]
.col-7.img-col[
<!-- @todo version with only the individual shaded -->
<img src="img/communication-diagram.svg" alt="Communication diagram" style="width:550px;" />
]

---

# Communication Example: Spatial Partitioning

.col-5[
+ Spatially partitioned messaging


+ Partition the environment into a grid
+ Read from Moore's Neighbourhood
+ Agent @todo reads **18** messages <!-- @ todo replace with key/icon -->


.commtable[
| Communication Strategy | # Messages | 
|------------------------|------------|
| All-to-all             |         42 |
| Spatial                |         18 |
]
]
.col-7.img-col[
<!-- @todo version with blue shading only. Add a radius-width circle. -->
<img src="img/communication-diagram.svg" alt="Communication diagram" style="width:550px;" />
]

---

# Communication Example: Graph-based

.col-5[
+ Graph Based Communication


+ Couple messages to graph data structure
+ Read from relevant part of graph
+ Agent @todo reads **5** messages <!-- @ todo replace with key/icon -->


.commtable[
| Communication Strategy | # Messages | 
|------------------------|------------|
| All-to-all             |         42 |
| Spatial                |         18 |
| Graph                  |          5 |
]
]
.col-7.img-col[
<!-- @todo only graph comm? colouring? -->
<img src="img/communication-diagram.svg" alt="Communication diagram" style="width:550px;" />
]

---

# Graph Based Communication Implementation

+ Compressed Sparse Row (CSR) representation of graph 
+ Messages contain *edge* or *vertex* index
+ Sort message list based on index
    + *Counting Sort*
    + Shared-memory atomics 
    + Builds histogram to access messages
+ Can access a single edge, or explore using CSR 
+ Agents on the same edge are executed on neighbouring threads
+ Implemented in FLAME GPU 1.5.0

<!-- @todo - image. -->

---

# Graph Based Communication Performance

.col-4[
+ Measured performance of message input/output


+ Higher output cost 
    + ~0.5ms vs ~0.2ms


+ **Much Lower** iteration cost
    + ~ 1ms vs ~ 120ms
]
.col-8.img-col[.w-90[
![Average Message Iteration Kernel Execution time](img/communication-input-time.png)
]]

---

# Grid size performance (@todo rename)

.col-4[
+ Re-ran benchmark using graph-based communication
+ Titan V
+ 3 repetitions


+ **Significant performance improvement!**
]
.col-8.img-col[
.w-90[
![Grid-scale Performance](img/popsize-gridsize-brute-spatial-graph-linear.png)
]
]

---

# Grid size performance (@todo rename)

.col-4[
+ Re-ran benchmark using graph-based communication
+ Titan V
+ 3 repetitions


+ 0.5 million vehicles
    + 82.04 seconds
    + **66x faster than CPU**
    + **44x faster than real-time**


]
.col-8.img-col[
.w-90[
![Grid-scale Perforamnce](img/popsize-gridsize-graph-log.png)
]
]

<!-- @Todo check all captions / alt textx -->


---

# Run-time per Simulation Iteration
.col-6.img-col[
.w-90[
![Per-iteration simulation runtime](img/gridsize-iteration-time-gr256.png)
]
]

.col-6[
+ Timed each iteration
+ i7 4770k vs Titan X (Pascal)
+ 256 x 256 grid
+ Total demand of 256,000 vehicles
+ Runtime increases per iteration as population grows
+ Periodic detector behaviour causes runtime increases
]

---

# Input Flow Benchmarks

.col-8.img-col[
.w-90[
![@todo](img/flow-gr64.png)
<!-- @todo - remove brute force for clarity. I.e. only show CPU, spacial, graph, graph txv -->

]
]
.col-4[
+ 64 x 64 grid
+ Varied input flow of vehicles per edge
    + I.e. vehicle density
+ @todo - describe the figure


+ Spatially partitioned messaging slower than CPU
+ Graph partitioned much quicker
+ Titan V and Titan Xp show similar performance
]
---

# Input Flow Benchmarks

.col-8.img-col[
.w-90[
![@todo](img/flow-gr256.png)
<!-- @todo - Titan V vs CPU figure? -->
]
]
.col-4[
+ 256 x 256 grid
+ Varied input flow of vehicles per edge
    + I.e. vehicle density
+ @todo describe the figure.


+ Spatial better than smaller grid
+ Graph even better
+ Large enough problem for larger GPU
]

---

class: impact 
# Other Work

+ Additional Functionality
+ Multi-Mode GPU Simulations
+ Machine Learning Surrogate Models
+ FLAME GPU 2

---

# Additional Functionality
<!-- @todo keep simple -->
.col-8[
+ Our simulator is not suitable for real-world models
+ Missing functionality needs implementing for real-world use
    + Multi-lane roads
    + Dynamic infrastructure
    + @todo

+ Further performance improvements
]
.col-4.img-col[
.w-90[
<!-- ![Label](img/file.png) -->
*@todo - image*
]
]


---

# Multi-Mode Simulation: Cars & Pedestrians
<!-- @todo simplify? -->

.col-4[
+ GPUs suitable for many modes of transport 
+ Including Pedestrian Simulation
+ Existing Pedestrian simulations implemented in FLAME GPU
+ Can simulate 100,000s of pedestrians
+ **Combine with road network simulation for shared environments**
]
.col-8.responsive[
<video width="1920" height="1080" controls loop muted poster="video/ped-london-1080p25.png">
    <source src="video/ped-london-1080p25.webm" type="video/webm">
  Your browser does not support the video tag.
</video>
<img src="video/ped-london-1080p25.png" class="video-poster" />

]
---

# Multi-Mode Simulation: Cars, Pedestrians & Rail

<!-- + Rail - CPU is good enough (S2AM) -->
<!-- + Namedrop Siemens, Rob and Paul. -->
<!-- @todo simplify -->
.col-6[
+ Collaboration with Siemens Rail
+ Multi-modal Smart-City Simulation
    + CPU based rail simulation
    + GPU accelerated pedestrian simulation
    + CPU based road network simulation (SUMO)
+ Evaluate rail network performance including pedestrian behaviours in station 


+ More information: [youtu.be/Rz_XzbZIMes](https://youtu.be/Rz_XzbZIMes)


+ **Robert Chisholm** [r.chisholm@sheffield.ac.uk](mailto:r.chisholm@sheffield.ac.uk)
]
.col-6.responsive[
<video width="1920" height="2160" controls loop muted poster="video/S2AM.png">
    <source src="video/S2AM.webm" type="video/webm">
  Your browser does not support the video tag.
</video>
<img src="video/S2AM.png" class="video-poster" />

]

---

# Surrogate Models

<!-- + Transport Simulation Surrogate Model -->
<!-- + Neural Network or Deep Learning Model -->
<!-- + Train on real world data and simulated data -->
<!-- + Long training time, very quick inference -->
<!-- Trival so its just what we’re doing with deep learning. -->


.col-6[
.smaller[
+ Transport Simulation **Surrogate Model**
+ Train (Deep) Neural Networks to predict simulator output
    + Use Real-world data
    + Simulated data
        + **including low-frequency events**
+ *Accurate*, *Robust* predictions
+ Faster than simulations

+ Useful for quick response / parameter sweep.


+ **James Pyle** [jcbpyle1@sheffield.ac.uk](mailto:jcbpyle1@sheffield.ac.uk)
]
]
.col-6.img-col[
.w-90[
<!-- !["FLAME GPU logo"](img/flamegpu-logo.jpg) -->
**@todo - image of machine learning / deep learning / GPUs / both.**
<!-- Deep Learning / DGX 1 / Mavericks picture.  -->
]
]

---

# Surrogate Models
<!-- @todo remove this slide. -->
.col-6[
.smaller[
+ Train **Surrogate Models**
    + Machine learning models which *predict the output of a complex system simulation*
    + Useful for calibration, validation, optimisation, etc 
+ I.e. Search parameter space using surrogate model
    + Simulate interesting parameters sets
    + Much faster than simulating whole parameter space
]
]
.col-6[
.smaller[
+ Transport simulation surrogate model 
+ Train with:
    + Real-world data
    + Simulated data
        + **including low-frequency events**
+ *Accurate*, *Robust* predictions


+ **James Pyle** [jcbpyle1@sheffield.ac.uk](mailto:jcbpyle1@sheffield.ac.uk)
]
]
.col-9[
![Label](img/sim_evaluation_of_surrogate_ga_population.png)
]
.col-3[
.smaller[
+ Genetic Algorithm driven search
+ Simple Neural Network surrogate
+ 500x faster than simulation
    + Less accurate
]
]

---

# FLAME GPU 2

<!-- @todo - less words. -->

.col-8[
+ Redeveloped from the ground-up
+ Under active development, aiming for an initial release this year
+ Increased flexibility
+ Improved performance
+ More maintainable code-base (Modern C++, no more XSLT)
+ New functionality
    + Automatic parameter exploration / tuning
    + Run many small simulations concurrently one one device
    + Multi GPU?
+ Lower barrier to entry
    + Python bindings (other languages/)
+ github.com/flamegpu2_dev
]
.col-4.img-col[
.w-90[
!["FLAME GPU logo"](img/flamegpu-logo.jpg)
*@todo - image*
]
]
 
---

class: impact

# Conclusions

---

# Conclusion

.col-6[

+ **Faster-than-real-time city-scale microsimulation**


+ Simulation of 500,000 vehicles
    + **44x faster than real-time**
    + **66x faster than Aimsun 8.1 (CPU)**


+ Achieved using FLAME GPU
    + New graph-based agent communication strategy
    + Cross-validated implementation
    + FLAME GPU 2 is under development
]
.col-6.img-col[
.w-90[
![Road Network Microsimulation](img/ttrig-screenshot.png)
<!-- @todo - increase contrast of picture ? -->
]
]
---

# Thank You

.smaller[
.col-4[
+ Peter Heywood
    + p.heywood@sheffield.ac.uk
    + [ptheywood.uk](http://ptheywood.uk)
    + [rse.shef.ac.uk](https://rse.shef.ac.uk)


+ Paul Richmond
    + p.richmond@sheffield.ac.uk
    + [paulrichmond.shef.ac.uk](http://paulrichmond.shef.ac.uk)


+ Robert Chisholm
    + r.chisholm@sheffield.ac.uk


+ James Pyle
    + jcbpyle1@sheffield.ac.uk

.w-60[
![The University of Sheffield Logo](img/tuoslogo_cmyk_hi.jpg)
]

]
.col-7.offset-1[
#### Supported by
+ EPSRC fellowship “Accelerating Scientific Discovery with Accelerated Computing” (EP/N018869/1)
+ DfT Transport Technology Research Innovation Grant (T-TRIG July 2016)

<br />

#### More Information

*"Data-parallel agent-based microscopic road network simulation using graphics processing units"* 
    
Peter Heywood, Steve Maddock, Jordi Casas, David Garcia, Mark Brackstone & Paul Richmond. 2017 

[doi.org/10.1016/j.simpat.2017.11.002](https://doi.org/10.1016/j.simpat.2017.11.002)

]
]
