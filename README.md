# Disclaimer
This application is a UI replication of the [Headspace app](https://apps.apple.com/us/app/headspace-sleep-meditation/id493145008?platform=iphone). Most visible content and all of the layout/design is directly copied from the Headspace app, so credit goes to those lovely folks. Please be mindful of this. This repo is public as a means for sharing my learning progress and skill development.

# Overview
I started this project as a means to practice my Swift UI skills without the need to come up with a novel app and my own design ideas. I found this approach forced me to figure out how to properly implement designs I might have otherwise avoided. As you might imagine, the app is large and while I did manage to include most screens and much of the UX experience, I have not yet brought this project up to production quality. A few items still on the TODO list include:

- Better attention to supporting Accessibility options
- Support for both light and dark modes (currently only dark)
- Refinement of transitions and animations throughout the app
- Added UI Testing
- Additional Unit Testing where it makes sense (business logic is minimal)
- Revisiting and replacing placeholder imagery

## Main Tab Sections
Of these three sections, the element that caused me the most head scratching and days of reading and searching was actually that innocuous little dotted line between activity status indicators on the Today tab. In the end, the solution was to use `PreferenceKey` and pass the positions from the individual icon views back up to the parent view. It was a simple and satisfyingly clean solution once it came together.

<img width="1038" alt="HeadspaceMirror-MainTabScreen" src="https://github.com/user-attachments/assets/bfbef33d-ac1b-46ca-81b3-8f70695ae04d">

## Content Sections
Without actual imagery for most of the content screens they are a little drab, but they follow the overall structure, and can very easily be updated to include graphics if I ever get to that. While it would be fun to go back to my illustration roots and spend some time creating a bunch of snazzy assets to use, I decided it wasn't the most valuable use of my time at the moment.

Within these screens, the Featured Activity Carousel took a bit of time to figure out. I went down a few wrong paths in my hunt for finding the best approach. In the end, my searches and experiments turned up a very handy modifier `.scrollTargetBehavior(.viewAligned)`, and combined with `.scrollPosition(id: $scrollIndex)` it gave me what I needed to solve the problem with just a few lines of code.

<img width="1034" alt="HeadspaceMirror-ContentScreens" src="https://github.com/user-attachments/assets/112d4d1e-b318-489d-839b-aa7bd34f7529">

## Imagery
While I specifically stayed away from spending time creating imagery, I did play around with creating custom `Shape` objects and `Path` creation varients like `addLine` `addCurve` and `addArc`. In a few special places I took on the challenge of recreating images using these tools. 

<img width="1038" alt="Screenshot 2024-08-16 at 3 28 41 PM" src="https://github.com/user-attachments/assets/18eb4e5e-e1c2-4aca-81ae-a2d31e49bfe4">


The quality of the underlying code for each varies as I was learning and adapting my approach throughout the process. At some point I'd love to go back and rethink this as a flexible box of components to enable easy image creation. For now it will stay as the learning experiment it was.



