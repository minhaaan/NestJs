//
//  ViewController.swift
//  client
//
//  Created by 최민한 on 2022/05/29.
//

import UIKit

class ViewController: UIViewController {
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.textColor = .black
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 8
        textView.isUserInteractionEnabled = false
        textView.font = .systemFont(ofSize: 20)
        return textView
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("action", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
    }
    
    @objc private func buttonTapped() {
        guard let url = URL(string: "http://localhost:3000/") else { return }
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
                guard let stringData = String(data: data, encoding: .utf8) else { return }
                textView.text = stringData
            } catch {
                textView.text = error.localizedDescription
            }
        }
    }

}

// MARK: Layout

extension ViewController {
    private func setupLayout() {
        view.backgroundColor = .white
        
        view.addSubview(button)
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

