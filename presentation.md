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

# Outline

+ [3] Smart City Simulation - Why
+ [3] CPU microsim - not good enough
+ [3] GPUs are the solution - but not easy
+ [2] What we did - FLAME GPU sim + summary of sections
+ [5] Reference simulator - Model, network + benchmarks results
+ [2] FLAME GPU implementation diagram.
+ [5] FLAME GPU results
+ [20?] FLAME GPU implementation details / optimisations made which enable the perf. 
+ [1] Conclusion
+ [1] Contact/Thanks.

---


# Transport Network Simulations
.col-6[
+ Global transport demand is increasing <!-- @todo - cite -->
+ Many constraints on transport networks
+ Simulations can improve the use of limited resources
    + Planning
    + Management
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

# Transport Network Simulations
.col-6[
+ Simulations are becoming more computationally expensive
    + **Larger** 
        - City-scale, National-scale
    + **More Complex** 
        - CAVs, Smarter Infrastructure
        - Multi-Mode
    + **More Permutations** 
        - Weather, Demand, etc.


+ Performance is limiting the use of simulation <!-- [cite] --> <!-- @todo -->
+ **Faster simulators are required** 
    + Better-than-real-time
]
.col-6.img-col[
.w-90[
![Transport Network](img/sheffield-map-smaller.png)
]
]

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


# @todo

.col-6[
.small[
#### @todo - backup content?
]
]









