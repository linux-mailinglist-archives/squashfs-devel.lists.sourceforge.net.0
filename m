Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDC1520B02
	for <lists+squashfs-devel@lfdr.de>; Tue, 10 May 2022 04:10:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1noFKD-0003z9-8l; Tue, 10 May 2022 02:10:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nnk2F-0008St-79
 for squashfs-devel@lists.sourceforge.net; Sun, 08 May 2022 16:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y8ghZT+NmFxYBiVpUw6Bi71blCh8zW2iKN+PbwKuq9s=; b=WNxaifoUb+VKqkOh1L7VmFk3cx
 wl7pRzJ9be8/9btSersI2C0PnBvtY/ZodPgOJNFEyjRAhNUQAabB08veHl6CjuawikbhKe27VB/p+
 SvAOjWnOflLjHSZ3vleLHjDxPFq7g7t3RLACI3kp1c6SWgDJNIi7VFX7bDgUGokW1S0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y8ghZT+NmFxYBiVpUw6Bi71blCh8zW2iKN+PbwKuq9s=; b=OvdxptG2FE0uT1tIFaGb7BpuhF
 LqvcERdfUn/YiMkbf1vVCffhJEbHwk2IMjid6dVNYsaWbIqJZLOLnZpB/qE9c6S7AGxs4xyq4j3Wc
 11D+nb1VJGjkjhj7EmaHUm0tDF9EOodmCjxTBjMuaRIG9qPzEESRsNX5LpLyBMBRlXBM=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnk26-0001Py-Tk
 for squashfs-devel@lists.sourceforge.net; Sun, 08 May 2022 16:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y8ghZT+NmFxYBiVpUw6Bi71blCh8zW2iKN+PbwKuq9s=; b=Qe3c5i9yjGfXK8qv+GlCS+lcCI
 zNXfOfvBNWlybFN9h7Avz08KGeZFg2AkLgpwD8cOzhdNWiG5c/J/nLhcsomh2Z8oGKm+bIQ5sqX3F
 pkh4gPrT/6dhHOylhsl8iSXluDlaB1SVH7rEpp3rujElhZxDlI06Y5t2b2hI2AnQOZW3Zc7WB1R5h
 XDmk5KpnP+6RtQbmfRtVmLEHjs7uANoP27Scgs6nz509tnzZNjKugaAcYJ4Sq74ArzH8qiRUyAuqF
 asTntfjBNOaVS6JJmMHf2qvxiUAfPkQ1Rx2g3HjjGOfsQ2OB+KLVVtaZOyRT2ykLFnmAwScfq48Qy
 ublG50Bw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nnk1f-002f3N-Iw; Sun, 08 May 2022 16:44:55 +0000
Date: Sun, 8 May 2022 17:44:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Song, Xiongwei" <Xiongwei.Song@windriver.com>
Message-ID: <Ynfzh2ifG85MZEoN@casper.infradead.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, May 08, 2022 at 02:46:40PM +0000, Song,
 Xiongwei wrote:
 > I am facing a performance regression on squashfs. There are many squashfs
 > partitions on our board. I am doing the operations below o [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1nnk26-0001Py-Tk
X-Mailman-Approved-At: Tue, 10 May 2022 02:10:09 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, "squashfs-devel@lists.sourceforge.net"
 <squashfs-devel@lists.sourceforge.net>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On Sun, May 08, 2022 at 02:46:40PM +0000, Song, Xiongwei wrote:
> I am facing a performance regression on squashfs.  There are many squashfs 
> partitions on our board. I am doing the operations below on 90 squashfs
> partitions:

Hi Xiongwei.  Thanks for the report.  Hsin-Ye and I have been working on
this problem off-list.  Hsin-Ye, could you send the latest version?


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
