---
layout: post
title: "TypeScript - How to declare static methods on enum"
categories: [tech]
---

If you are coming from the Java world you might be interested in being able to declare static methods on the enum itself.

Here is a way to do it, by using TypeScript `namespace`.

{% highlight javascript %}
enum MyEnum {
    ALFA = 'ALFA',
    BRAVO = 'BRAVO',
    CHARLIE = 'CHARLIE',
    UNKNOWN = 'UNKNOWN'
}

namespace MyEnum {

    export const ALL_VALUES: string[] = Object.values(MyEnum);

    export function parse(val: string): MyEnum {
        if(!val) {
            return MyEnum.UNKNOWN;
        }

        const found = ALL_VALUES.indexOf(val);

        return ALL_VALUES[found] || MyEnum.UNKNOWN;
    }
}

function checkEnumValue(val: string): void {
    const enumValue = MyEnum.parse(val);
    console.log(`MyEnum.parse('${val}') ==> '${enumValue}'`);
}

checkEnumValue(null);
checkEnumValue("");
checkEnumValue("ALFA");
checkEnumValue("Quebec");
{% endhighlight %}

Tested with TypeScript v3.6.3