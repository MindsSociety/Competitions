#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <set>
#include <algorithm>
#include <limits>

void addToSet(int row, std::set<int> & cards)
{
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');

    for(int i = 0; i < 4; i++)
    {
        std::string line;
        std::getline(std::cin, line);

        if(i + 1 != row)
        {
            continue;
        }

        std::stringstream strs(line);

        for(int j = 0; j < 4; j++)
        {
            int val;
            strs >> val;
            cards.insert(val);
        }
    }
}

int main(int argc, char ** argv)
{
    int numCases = 0;

    std::cin >> numCases;

    std::stringstream output;

    for(int i = 0; i < numCases; i++)
    {
        std::set<int> first, second, inter;

        int row = 0;

        std::cin >> row;

        addToSet(row, first);

        std::cin >> row;

        addToSet(row, second);

        std::set_intersection(first.begin(), first.end(), second.begin(), second.end(), std::inserter(inter, inter.end()));

        output << "Case #" << i + 1 << ": ";

        if(inter.size() == 1)
        {
            output << *inter.begin() << std::endl;
        }
        else
        {
            output << (inter.size() == 0 ? "Volunteer cheated!" : "Bad magician!") << std::endl;
        }
    }

    std::cout << output.str();
}
