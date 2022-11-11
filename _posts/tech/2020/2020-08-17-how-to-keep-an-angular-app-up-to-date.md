---
layout: post
title: "How to keep an Angular app up to date"
categories: [tech]
---

### Step-by-Step guide

Angular Team made it quite easy to update an Angular application from a version to another. 

They have created [a dedicated website](https://update.angular.io) for that purpose

### Useful commands

- `ng update` - Angular CLI tool to upgrade Angular dependencies
- `npm outdated` - lists the dependencies that have new versions available
- `npm audit` - tries to find issues related to the dependencies you are using. Issues can be fixed with `npm audit fix`

### Tips

- Keep as less dependencies as possible
- Don't forget to bump up your TypeScript version! 
- To tidy up your `package.json` file, go to the Angular Documentation, grab a sample project from there and have a look to its `package.json`. It will give you an idea about the minimal set of dependencies you need.
- Avoid fancy libraries (especially if they are not used a lot), try to stick to what Angular provides
- Update your Angular CLI! 