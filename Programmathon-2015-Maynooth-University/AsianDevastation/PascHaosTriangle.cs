using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PascHaosTriangle
{
    class PascHaosTriangle
    {
        static void Main(string[] args)
        {
            var haosTriangle = ReadInTriangle();
            var myTriangle = GeneratePascalTriangle(haosTriangle.Count);

            Console.WriteLine(CompareTriangles(haosTriangle, myTriangle));

            Console.Read();
        }

        private static int CompareTriangles(List<List<int>> haosTriangle, List<List<int>> myTriangle)
        {
            for (int i = 0; i < haosTriangle.Count; i++)
            {
                var row = haosTriangle[i];
                for (int j = 0; j < row.Count; j++)
                {
                    if (row[j] != myTriangle[i][j]) return i + 1;
                }
            }
            return 0;
        }

        static List<List<int>> GeneratePascalTriangle(int numberOfRows)
        {
            var triangle = new List<List<int>>();
            for(int i = 0; i < numberOfRows; i++)
            {
                switch (i)
                {
                    case 0:
                        triangle.Add(new List<int> { 1 });
                        break;
                    default:
                        List<int> row = new List<int>();
                        row.Add(1);
                        for (int j = 0; j < i - 1; j++)
                        {
                            row.Add(triangle[i - 1][j] + triangle[i - 1][j + 1]);
                        }
                        row.Add(1);
                        triangle.Add(row);
                        break;
                }
            }
            return triangle;
        }

        static List<List<int>> ReadInTriangle()
        {
            int rows = int.Parse(Console.ReadLine());
            var triangle = new List<List<int>>();
            for (int i = 0; i < rows; i++)
            {
                var row = new List<int>();
                Console.ReadLine().Split().Select(p => int.Parse(p)).ToList().ForEach(p => row.Add(p));
                triangle.Add(row);
            }
            return triangle;
        }
    }
}
