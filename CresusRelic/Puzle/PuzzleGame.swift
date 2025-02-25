//
//  TestView.swift
//  CresusRelic
//
//  Created by D K on 23.02.2025.
//

import SwiftUI

struct PuzzlePiece: Identifiable {
    let id: Int
    var image: Image
    var position: CGPoint
    var correctPosition: CGPoint
    var isFixed: Bool = false
    var zIndex: Double = 0
}

struct PuzzleGameView: View {
    
    var completion: () -> ()
    
    let image = UIImage(named: "puzzleMap")!
    let rows = 5
    let columns = 4
    let pieceSize: CGFloat = 80
    let snapDistance: CGFloat = 30
    
    @State private var pieces: [PuzzlePiece] = []
    @State private var shuffledPieces: [PuzzlePiece] = []
    @State private var isSolved = false
    @State private var showAlert = false
    @State private var draggedPieceId: Int? = nil
    
    var body: some View {
        VStack {

            ZStack {
                ForEach($shuffledPieces) { $piece in
                    piece.image
                        .resizable()
                        .frame(width: pieceSize, height: pieceSize)
                        .position(piece.position)
                        .zIndex(piece.zIndex)
                        .gesture(
                            piece.isFixed ? nil : DragGesture()
                                .onChanged { value in
                                    if !piece.isFixed {
                                        piece.zIndex = getMaxZIndex() + 1
                                        draggedPieceId = piece.id
                                        piece.position = value.location
                                    }
                                }
                                .onEnded { value in
                                    piece.zIndex = piece.isFixed ? 0 : 1
                                    draggedPieceId = nil
                                    snapPieceToCorrectPosition(piece: &piece)
                                    checkPuzzle()
                                }
                        )
                }
            }
            .frame(width: pieceSize * CGFloat(columns), height: pieceSize * CGFloat(rows))
            .background {
                Image("secondBG")
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 2)
                    .overlay {
                        Rectangle()
                            .foregroundStyle(.black.opacity(0.7))
                    }
                    .frame(width: pieceSize * CGFloat(columns), height: pieceSize * CGFloat(rows))
                    .clipped()
                    .cornerRadius(12)
                    .shadow(radius: 10)
            }
            .onAppear {
                setupPuzzle()
            }
        }

    }
    
    private func setupPuzzle() {
        pieces = splitImageIntoPieces(image: image, rows: rows, columns: columns)
        shuffledPieces = pieces.shuffled().map {
            var piece = $0
            piece.zIndex = 1
            return piece
        }
    }
    
    private func splitImageIntoPieces(image: UIImage, rows: Int, columns: Int) -> [PuzzlePiece] {
        let pieceWidth = image.size.width / CGFloat(columns)
        let pieceHeight = image.size.height / CGFloat(rows)
        var pieces: [PuzzlePiece] = []
        
        for row in 0..<rows {
            for column in 0..<columns {
                let xOffset = CGFloat(column) * pieceWidth
                let yOffset = CGFloat(row) * pieceHeight
                
                let rect = CGRect(x: xOffset, y: yOffset, width: pieceWidth, height: pieceHeight)
                if let croppedCGImage = image.cgImage?.cropping(to: rect) {
                    let croppedImage = UIImage(cgImage: croppedCGImage)
                    let piece = PuzzlePiece(
                        id: row * columns + column,
                        image: Image(uiImage: croppedImage),
                        position: CGPoint(x: CGFloat.random(in: 0..<pieceSize * CGFloat(columns)), y: CGFloat.random(in: 0..<pieceSize * CGFloat(rows))),
                        correctPosition: CGPoint(x: pieceSize / 2 + CGFloat(column) * pieceSize, y: pieceSize / 2 + CGFloat(row) * pieceSize)
                    )
                    pieces.append(piece)
                }
            }
        }
        
        return pieces
    }
    
    private func snapPieceToCorrectPosition(piece: inout PuzzlePiece) {
        let distance = hypot(piece.position.x - piece.correctPosition.x, piece.position.y - piece.correctPosition.y)
        
        if distance < snapDistance {
            piece.position = piece.correctPosition
            piece.isFixed = true
            piece.zIndex = 0
        }
    }
    
    private func checkPuzzle() {
        let allPiecesFixed = shuffledPieces.allSatisfy { $0.isFixed }
        
        if allPiecesFixed {
            isSolved = true
            showAlert = true
            completion()
        }
    }
    
    private func getMaxZIndex() -> Double {
        shuffledPieces.map { $0.zIndex }.max() ?? 0
    }
}
