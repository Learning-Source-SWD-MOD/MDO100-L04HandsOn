//
//  HomeViewController.swift
//  Tunez
//
//  Copyright © 2018 WOZ-U. All rights reserved.
//

import UIKit

enum MediaType {
	case audio
	case video
}

class HomeViewController: UIViewController {

	public static var session: URLSession?
    
    @IBOutlet weak var audioButton: UIButton?
    @IBOutlet weak var videoButton: UIButton?

	private let tagAudioButton = 11

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.title = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "Tunez"
        customizeAppearance()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if let session = HomeViewController.session {
			session.invalidateAndCancel()
			HomeViewController.session = nil
		}
	}
    
    // MARK: - Appearance

    private func customizeAppearance() {

    }
    
    // MARK: - Event handlers

	@IBAction func audioSelected(sender: UIButton) {
        selectSource(sender: sender)
	}

	@IBAction func videoSelected(sender: UIButton) {
        selectSource(sender: sender)
	}

    private func selectSource(sender: UIButton) {
		performSegue(withIdentifier: "showSearch", sender: sender)
	}

	// MARK: - Navigation
    
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let sender = sender as? UIButton, let title = sender.titleLabel?.text, let lvc = segue.destination as? SearchViewController {
			let text = title.lowercased()
			lvc.mediaType = (text == "audio" || text == "music") ? .audio : .video
		}
	}
}

