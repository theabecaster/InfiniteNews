//
//  NewsFeedView.swift
//  NewsApp
//
//

import SwiftUI

struct NewsFeedView: View {
    @ObservedObject var newsFeed = NewsFeed()
    
    var body: some View {
        List(newsFeed) { (article: NewsListItem) in
            NewsListItemView(article: article)
                .onAppear {
                    self.newsFeed.loadMoreArticles(currentItem: article)
            }
        }
    }
}

struct NewsListItemView: View {
    var article: NewsListItem
    
    var body: some View {
        HStack {
            UrlImageView(urlString: article.urlToImage)
            VStack(alignment: .leading) {
                Text("\(article.title)")
                    .font(.headline)
                Text("\(article.author ?? "No Author")")
                    .font(.subheadline)
            }
        }
    }
}

struct NewsFeedView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeedView()
    }
}
