using System;

namespace MissingNumber
{
    static class MissingNumber
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());

            int lowest = Int32.MaxValue;
            int highest = 0;
            int total = 0;

            for (int i = 0; i < n; i++)
            {
                var input = int.Parse(Console.ReadLine());
                total += input;
                if (input < lowest) lowest = input;
                if (input > highest) highest = input;
            }

            int predictedSum = 0;
            for (int i = lowest; i <= highest; i++)
            {
                predictedSum += i;
            }

            Console.WriteLine(predictedSum - total);
            Console.Read();
        }
    }
}
