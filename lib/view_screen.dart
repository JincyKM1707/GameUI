import 'package:example_program1/model/design_model.dart';
import 'package:example_program1/provider/design_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DesignProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Game of Thrones'),
        centerTitle: true,
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              children: [
                SizedBox(height: screenHeight * 0.02),
                SizedBox(
                  height: screenHeight * 0.08, // 8% of screen height
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      int season = index + 1;
                      bool isSelected = season == provider.selectedSeason;
                      return GestureDetector(
                        onTap: () {
                          provider.selectSeason(season);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.02),
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.12,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.orange : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '$season',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Season : ${provider.selectedSeason}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(color: Colors.white),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.design.length,
                    itemBuilder: (context, index) {
                      Design episode = provider.design[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.01,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${episode.number.toString().padLeft(2, '0')} - ${episode.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              'Aired Date : ${episode.airdate}',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            episode.imageUrl.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      episode.imageUrl,
                                      width: double.infinity,
                                      height: screenHeight * 0.25,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const SizedBox(),
                            SizedBox(height: screenHeight * 0.01),
                            Text(
                              episode.summary
                                  .replaceAll(RegExp(r'<[^>]*>'), ''),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.04,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
