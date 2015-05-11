using System;
using System.Collections.Generic;
using System.Linq;

namespace Programmathon2015
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("What is the weight limit?");
            var weightLimit = int.Parse(Console.ReadLine());
            Console.WriteLine("How many items do you wish to enter?");
            var numberOfItems = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter the items (weight value):");
            var itemList = new List<Item>();

            for (int i = 0; i < numberOfItems; i++)
            {
                var input = Console.ReadLine().Split();
                itemList.Add(new Item{
                    Weight = int.Parse(input[0]),
                    Value = int.Parse(input[1])
                });
            }

            var solutionList = Solve(itemList, weightLimit).OrderBy(p => p.Weight).ThenBy(p => p.Value).ToList();
            var totalValue = 0;
            solutionList.ForEach(p => totalValue += p.Value);

            Console.WriteLine("Total value: {0}", totalValue);
            solutionList.ForEach(p => Console.WriteLine("{0} {1}", p.Weight, p.Value));

            Console.Read();
        }

        struct Item
        {
            public int Weight { get; set; }
            public int Value { get; set; }
        }

        static List<Item> Solve(List<Item> items, int maxWeight)
        {
            items.RemoveAll(p => p.Weight > maxWeight);

            var table = new int[items.Count + 1, maxWeight + 1];
            for (int w = 0; w < maxWeight; w++)
            {
                table[0, w] = 0;
            }

            for (int i = 1; i <= items.Count; i++)
            {
                for (int w = 0; w <= maxWeight; w++)
                {
                    var currentItem = items[i - 1];
                    table[i, w] =
                        currentItem.Weight > w ?
                        table[i - 1, w] :
                        Math.Max(
                            table[i - 1, w], table[i - 1, w - currentItem.Weight] + currentItem.Value);
                }
            }

            //var maxValue = table[items.Count, maxWeight];

            var solutionList = new List<Item>();

            for (int i = items.Count, w = maxWeight; i > 0; i--)
            {
                if (table[i, w] != table[i - 1, w])
                {
                    var currentItem = items[i - 1];
                    solutionList.Add(currentItem);
                    w -= items[i - 1].Weight;
                }
            }

            return solutionList;
        }
    }
}
