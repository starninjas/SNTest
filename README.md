# WasteLands Survival
========================================================================
CORE DESIGN PRINCIPLES
------------------------------------------------------------------------

- Do as much in node-space in the world as possible.
	- Minimize use of off-grid entities.
	- Avoid encapsulating things in inventories, machines, GUIs.
	- Crafting and transforming in-world.
- Minimal set of primitive composable functions.
	- Each node should do one job (or one part of a job).
	- Only include the most primitive, fungible components.
	- Avoid redundant functionality, include fewest possible
	  different elements.
	- Complex emergent gameplay by combining simple nodes.
- Challenging and constrained gameplay.
	- Limited inventories, very restricted item storage, e.g. one
	  stack per node.
	- Large, complex machines to design and build for resource
	  transformations.
	- Subtle environmental hazards, like deadfalls and pestilence.
- Rich, subtle interactions.
	- Digging, placing, punching and battering.
	- Different effects from different tools (including empty hand).
	- Different faces of node may have different effects.
- Focus on puzzle-oriented single-player/cooperative gameplay.
	- Avoid dependence on action, combat, PvP.
	- Slow-moving hazards, players have a chance to think and plan.
	- Acessible for slow reflexes, slow networks, mobile devices.


........................................................................
========================================================================

## downloading
Make sure that you add the "--recursive" option to clone:
```
git clone --recursive https://github.com/Gerold55/WasteLands_Survival.git
```
else the submodule folders will be empty.

To pull all changes in the repo including changes in the submodules use:
```
git pull --recurse-submodules
```
